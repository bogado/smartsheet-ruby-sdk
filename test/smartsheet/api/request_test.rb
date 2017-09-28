require_relative '../../test_helper'
require 'smartsheet/api/header_builder'
require 'faraday'

describe Smartsheet::API::Request do
  before do
    @endpoint_spec = Smartsheet::API::EndpointSpec.new(:get, ['a'])

    @some_url = 'some/url'
    @some_header = { h: '' }
    @some_body = { b: '' }
    @some_params = { p: '' }

    mock_url_builder = mock
    mock_url_builder.stubs(:build).returns(@some_url)
    Smartsheet::API::UrlBuilder.stubs(:new).returns(mock_url_builder)
    mock_header_builder = mock
    mock_header_builder.stubs(:build).returns(@some_header)
    Smartsheet::API::HeaderBuilder.stubs(:new).returns(mock_header_builder)
    mock_body_builder = mock
    mock_body_builder.stubs(:build).returns(@some_body)
    Smartsheet::API::BodyBuilder.stubs(:new).returns(mock_body_builder)
  end

  it 'provides url' do
    request_spec = Smartsheet::API::RequestSpec.new

    Smartsheet::API::Request
      .new(TOKEN, @endpoint_spec, request_spec, nil)
      .url.must_equal @some_url
  end

  it 'provides headers' do
    request_spec = Smartsheet::API::RequestSpec.new

    Smartsheet::API::Request
      .new(TOKEN, @endpoint_spec, request_spec, nil)
      .headers.must_equal(@some_header)
  end

  it 'provides params' do
    request_spec = Smartsheet::API::RequestSpec.new(params: @some_params)

    Smartsheet::API::Request
      .new(TOKEN, @endpoint_spec, request_spec, nil)
      .params.must_equal @some_params
  end

  it 'provides body' do
    request_spec = Smartsheet::API::RequestSpec.new(body: @some_body)

    Smartsheet::API::Request
      .new(TOKEN, @endpoint_spec, request_spec, nil)
      .body.must_equal @some_body
  end
end
