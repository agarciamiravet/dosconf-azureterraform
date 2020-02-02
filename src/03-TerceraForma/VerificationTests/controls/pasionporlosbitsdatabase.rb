title "Check database pasionporlosbits"

control 'azure_sql_database_pasionporlosbits' do
    title "Test database settings"
    desc "Test settings of pasionporlosbits database staging"
    describe azurerm_sql_database(resource_group: 'rg-dosconf2020-staging', server_name: 'sql-pasionporlosbits-staging', database_name: 'sqldb-pasionporlosbits-staging') do
        it            { should exist }
        its('name')   { should eq "sqldb-pasionporlosbits-staging" }
        its('location') { should eq "westeurope" }
        its('sku.name') { should eq "Standard" }
        its('properties.collation') { should eq "SQL_Latin1_General_CP1_CI_AS"}
      end
end