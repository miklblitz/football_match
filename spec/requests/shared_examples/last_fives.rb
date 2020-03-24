RSpec.shared_examples "correct json results" do |parameter, tops|

  let(:resp) { parameter }

  resp.each_with_index {|r,i|
    it "uses the given parameter" do
      expect(r["id"]).to eq(tops.keys[i])
    end

    it "uses the given parameter" do
      expect(r["top"]).to eq(tops.values[i])
    end
  }
  
end