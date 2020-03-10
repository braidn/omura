require_relative '../spec_helper'

class RootTest < RequestTest
  describe '#GET' do
    subject { app.get '/' }

    it 'resolves with a success code' do
      _(subject.status).must_equal 200
    end
  end
end
