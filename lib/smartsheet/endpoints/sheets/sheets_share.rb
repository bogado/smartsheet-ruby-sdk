require 'smartsheet/endpoints/share/share'

module Smartsheet
  # Sheet Sharing Endpoints
  # @see https://smartsheet-platform.github.io/api-docs/?ruby#sheet-sharing API Sheet Sharing Docs
  class SheetsShare
    attr_reader :client
    private :client

    URL = ['sheets', :sheet_id].freeze

    def initialize(client)
      @client = client
    end

    def delete(sheet_id:, share_id:, params: {}, header_overrides: {})
      delete_share(
          share_id: share_id,
          url: URL,
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id
      )
    end

    def get(sheet_id:, share_id:, params: {}, header_overrides: {})
      get_share(
          share_id: share_id,
          url: URL,
          params: params,
          header_overrides: header_overrides,
          sheet_id: sheet_id
      )
    end

    def list(sheet_id:, params: {}, header_overrides: {})
      list_share(
          url: URL,
          header_overrides: header_overrides,
          params: params,
          sheet_id: sheet_id
      )
    end

    def create(sheet_id:, body:, params: {}, header_overrides: {})
      create_share(
          url: URL,
          header_overrides: header_overrides,
          params: params,
          body: body,
          sheet_id: sheet_id
      )
    end

    def update(sheet_id:, share_id:, body:, params: {}, header_overrides: {})
      update_share(
          share_id: share_id,
          url: URL,
          params: params,
          header_overrides: header_overrides,
          body: body,
          sheet_id: sheet_id
      )
    end

    private

    include Smartsheet::Share
  end
end