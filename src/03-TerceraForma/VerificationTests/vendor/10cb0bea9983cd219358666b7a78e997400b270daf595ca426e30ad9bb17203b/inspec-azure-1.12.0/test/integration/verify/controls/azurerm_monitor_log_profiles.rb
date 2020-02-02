log_profile = input('log_profile_name', value: nil)

control 'azurerm_monitor_log_profiles' do
  describe azurerm_monitor_log_profiles do
    its('names') { should include(log_profile) }
  end
end
