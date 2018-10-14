require 'text'

describe Text do
  subject(:client) { described_class.new }
  allow(client).to receive(:send_text).and_return("text sent")

  it ""
end
