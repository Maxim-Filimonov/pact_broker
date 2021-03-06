require 'pact_broker/repositories'
require 'json'

class ProviderStateBuilder

  include PactBroker::Repositories

  def create_pricing_service
    @pricing_service_id = pacticipant_repository.create(:name => 'Pricing Service', :repository_url => 'git@git.realestate.com.au:business-systems/pricing-service').save(raise_on_save_failure: true).id
    self
  end

  def create_contract_proposal_service
    @contract_proposal_service_id = pacticipant_repository.create(:name => 'Contract Proposal Service', :repository_url => 'git@git.realestate.com.au:business-systems/contract-proposal-service').save(raise_on_save_failure: true).id
    self
  end

  def create_contract_proposal_service_version number
    @contract_proposal_service_version_id = version_repository.create(number: number, pacticipant_id: @contract_proposal_service_id).id
    self
  end

  def create_contract_email_service
    @contract_email_service_id = pacticipant_repository.create(:name => 'Contract Email Service', :repository_url => 'git@git.realestate.com.au:business-systems/contract-email-service').save(raise_on_save_failure: true).id
    self
  end

  def create_contract_email_service_version number
    @contract_email_service_version_id = version_repository.create(number: number, pacticipant_id: @contract_email_service_id).id
    self
  end

  def create_ces_cps_pact
    @pact_id = pact_repository.create(version_id: @contract_email_service_version_id, provider_id: @contract_proposal_service_id, json_content: json_content).id
    self
  end

  def create_condor
    @condor_id = pacticipant_repository.create(:name => 'Condor').save(raise_on_save_failure: true).id
    self
  end

  def create_condor_version number
    @condor_version_id = version_repository.create(number: number, pacticipant_id: @condor_id).id
    self
  end

  def create_pricing_service_version number
    @pricing_service_version_id = version_repository.create(number: number, pacticipant_id: @pricing_service_id).id
    self
  end

  def create_pact
    @pact_id = pact_repository.create(version_id: @condor_version_id, provider_id: @pricing_service_id, json_content: json_content).id
    self
  end

  def create_pact_with_hierarchy consumer_name, consumer_version, provider_name
    provider = PactBroker::Models::Pacticipant.create(:name => provider_name)
    consumer = PactBroker::Models::Pacticipant.create(:name => consumer_name)
    version = PactBroker::Models::Version.create(:number => consumer_version, :pacticipant => consumer)
    PactBroker::Models::Pact.create(:consumer_version => version, :provider => provider)
  end

  def create_version_with_hierarchy pacticipant_name, pacticipant_version
    pacticipant = PactBroker::Models::Pacticipant.create(:name => pacticipant_name)
    PactBroker::Models::Version.create(:number => pacticipant_version, :pacticipant => pacticipant)
  end

  def create_tag_with_hierarchy pacticipant_name, pacticipant_version, tag_name
    version = create_version_with_hierarchy pacticipant_name, pacticipant_version
    PactBroker::Models::Tag.create(name: tag_name, version: version)
  end

  def create_pacticipant pacticipant_name
    @pacticipant = PactBroker::Models::Pacticipant.create(:name => pacticipant_name)
    self
  end

  def create_version version_number
    @version = PactBroker::Models::Version.create(:number => version_number, :pacticipant => @pacticipant)
    self
  end

  def create_tag tag_name
    @tag = PactBroker::Models::Tag.create(name: tag_name, version: @version)
    self
  end

  private

  # def create_pacticipant name
  #   pacticipant_repository.create(:name => name)
  # end

  # def create_version number, pacticipant
  #   version_repository.create(number: number, pacticipant: pacticipant)
  # end

  # def create_pact version, provider
  #   pact_repository.create(consumer_version: version, provider: provider, json_content: json_content)
  # end

  def json_content
    json_content = {
      "consumer"     => {
         "name" => "Condor"
       },
       "provider"     => {
         "name" => "Pricing Service"
       },
       "interactions" => []
     }.to_json
   end

end