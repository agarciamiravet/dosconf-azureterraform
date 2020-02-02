resource_group = input('resource_group',            value: nil)
nsg            = input('network_security_group',    value: nil)
nsg_id         = input('network_security_group_id', value: nil)

control 'azurerm_network_security_group' do
  describe azurerm_network_security_group(resource_group: resource_group, name: nsg) do
    it                            { should exist }
    its('id')                     { should eq nsg_id }
    its('name')                   { should eq nsg }
    its('type')                   { should eq 'Microsoft.Network/networkSecurityGroups' }
    its('security_rules')         { should_not be_empty }
    its('default_security_rules') { should_not be_empty }
    it                            { should_not allow_rdp_from_internet }
    it                            { should_not allow_ssh_from_internet }
  end

  describe azurerm_network_security_group(resource_group: resource_group, name: 'fake') do
    it { should_not exist }
  end

  describe azurerm_network_security_group(resource_group: 'does-not-exist', name: nsg) do
    it { should_not exist }
  end
end
