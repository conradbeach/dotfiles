#!/usr/bin/env python3
"""
Toggle a vertical split pane on the right side of the iTerm2 window.

Behavior:
- If only 1 pane: Create a vertical split (right pane gets 35% width)
- If split exists and maximized: Unmaximize to show both panes
- If split exists and not maximized: Maximize left pane (hides right pane)
"""

import iterm2

# Percentage of width for the right (side) pane
RIGHT_PANE_RATIO = 0.35


async def toggle_split(connection):
    app = await iterm2.async_get_app(connection)
    window = app.current_window

    if not window:
        return

    tab = window.current_tab
    if not tab:
        return

    sessions = tab.sessions

    if len(sessions) == 1:
        # Check if we're maximized (another pane exists but is hidden)
        menu_state = await iterm2.MainMenu.async_get_menu_item_state(
            connection, "Maximize Active Pane"
        )

        if menu_state.checked:
            # Currently maximized - unmaximize to reveal the hidden pane
            await iterm2.MainMenu.async_select_menu_item(
                connection, "Maximize Active Pane"
            )
            # Focus the right pane after unmaximizing
            await tab.async_select_pane_in_direction(iterm2.NavigationDirection.RIGHT)
        else:
            # Truly only one pane - create a split (new pane gets focus automatically)
            await create_split_with_ratio(tab.current_session, tab, RIGHT_PANE_RATIO)

    else:
        # Multiple panes visible - maximize the left pane to hide the right
        left_session = sessions[0]
        await left_session.async_activate()
        await iterm2.MainMenu.async_select_menu_item(
            connection, "Maximize Active Pane"
        )


async def create_split_with_ratio(session, tab, right_ratio):
    """
    Split the session vertically and resize to achieve the desired ratio.

    Args:
        session: The session to split
        tab: The tab containing the session
        right_ratio: The fraction of width for the right pane (0.0 to 1.0)
    """
    window = tab.window
    frame = await window.async_get_frame()

    cols = await session.async_get_variable("columns")
    if cols is None:
        await session.async_split_pane(vertical=True)
        return

    cols = int(cols)
    right_cols = int(cols * right_ratio)
    left_cols = cols - right_cols

    # Create the split
    new_session = await session.async_split_pane(vertical=True)

    # Set preferred width for both panes
    rows = await new_session.async_get_variable("rows")
    rows = int(rows) if rows else 50
    session.preferred_size = iterm2.util.Size(left_cols, rows)
    new_session.preferred_size = iterm2.util.Size(right_cols, rows)

    await tab.async_update_layout()

    # Restore original window frame to prevent shrinking
    await window.async_set_frame(frame)


async def main(connection):
    @iterm2.RPC
    async def toggle_split_rpc():
        await toggle_split(connection)

    await toggle_split_rpc.async_register(connection)


iterm2.run_forever(main)
