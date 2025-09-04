#!/usr/bin/env zsh

cc() {
    local servers_added=()
    
    # If no arguments, just run Claude Code
    if [[ $# -eq 0 ]]; then
        claude
        return $?
    fi
    
    # Check for help flag
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "cc - Claude Code with temporary MCP servers"
        echo ""
        echo "USAGE:"
        echo "  cc                    Run claude normally"
        echo "  cc [servers...]       Run claude with temporary MCP servers"
        echo "  cc --help, -h         Show this help"
        echo ""
        echo "AVAILABLE SERVERS:"
        echo "  p, playwright         Playwright MCP server"
        echo "  l, linear             Linear MCP server"
        echo "  r, rollbar            Rollbar MCP server"
        echo ""
        echo "EXAMPLES:"
        echo "  cc l                  Run claude with Linear MCP server"
        echo "  cc p r                Run claude with Playwright and Rollbar servers"
        echo "  cc linear playwright  Run claude with Linear and Playwright servers"
        return 0
    fi
    
    clean_up_servers() {
        if [[ ${#servers_added[@]} -gt 0 ]]; then
            echo "Cleaning up MCP servers..."
            for server_name in "${servers_added[@]}"; do
                if [[ -n "$server_name" ]]; then
                    echo "Removing MCP server: $server_name"
                    claude mcp remove "$server_name" --scope local
                fi
            done
        fi
    }
    
    # Parse arguments and add servers
    for arg in "$@"; do
        case "$arg" in
            p|playwright)
                echo "Adding MCP server: Playwright"
                if claude mcp add Playwright npx @playwright/mcp@latest --scope local; then
                    servers_added+=("Playwright")
                else
                    echo "Failed to add MCP server: Playwright"
                fi
                ;;
            l|linear)
                echo "Adding MCP server: Linear"
                if claude mcp add Linear https://mcp.linear.app/sse --transport sse --scope local; then
                    servers_added+=("Linear")
                else
                    echo "Failed to add MCP server: Linear"
                fi
                ;;
            r|rollbar)
                echo "Adding MCP server: Rollbar"
                if claude mcp add Rollbar --scope local -- node ~/development/rollbar-mcp-server/build/index.js; then
                    servers_added+=("Rollbar")
                else
                    echo "Failed to add MCP server: Rollbar"
                fi
                ;;
            *)
                echo "Unknown MCP server: $arg"
                echo "Available servers: p/playwright, l/linear, r/rollbar"
                return 1
                ;;
        esac
    done
    
    # Run claude
    echo "Running Claude with temporary MCP servers..."
    claude
    local claude_exit_code=$?
    
    # Clean up servers
    clean_up_servers
    
    return $claude_exit_code
}
