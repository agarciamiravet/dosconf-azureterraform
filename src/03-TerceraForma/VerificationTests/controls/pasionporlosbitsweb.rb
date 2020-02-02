title "Check web app pasionporlosbits in staging"

control "azure_webapp_pasionporlosbits"
describe azurerm_webapp(resource_group: 'rg-dosconf2020-staging', name: 'pasiondebits') do
  it { should exist }
  its('properties.httpsOnly') { should cmp true }
  its('properties.enabledHostNames') { should include "staging.pasionporlosbits.com" }
  its('configuration.properties') { should have_attributes(http20Enabled: true) }
  its('configuration.properties') { should have_attributes(minTlsVersion: "1.2")}
end