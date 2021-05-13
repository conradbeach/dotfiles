# Apartment Gem
def current_tenant
  Apartment::Tenant.current
end

def list_tenants
  Apartment::Tenant.each { |tenant| p tenant }
end

def switch_tenant(tenant)
  Apartment::Tenant.switch!(tenant)
end
