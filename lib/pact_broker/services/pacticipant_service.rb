require 'pact_broker/repositories'

module PactBroker

  module Services
    class PacticipantService

      extend PactBroker::Repositories

      def self.find_all_pacticipants
        pacticipant_repository.find_all
      end

      def self.find_pacticipant_by_name name
        pacticipant_repository.find_by_name(name)
      end

      def self.find_pacticipant_repository_url_by_pacticipant_name name
        pacticipant = pacticipant_repository.find_by_name(name)
        if pacticipant && pacticipant.repository_url
          pacticipant.repository_url
        else
          nil
        end
      end

      def self.update params
        pacticipant = pacticipant_repository.find_by_name(params.fetch(:name))
        pacticipant.update(params)
        pacticipant_repository.find_by_name(params.fetch(:name))
      end

      def self.create params
        pacticipant_repository.create(params)
      end

    end
  end
end