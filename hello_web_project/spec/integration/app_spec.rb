require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /names" do
    it "returns 200 OK with correct 3 name body" do
      response = get("/names")

      expect(response.status).to eq 200
      expect(response.body).to eq "Julia, Mary, Karim"
    end
  end

  context "POST to /sort-names" do
    it "returns 200 with names sorted alphabetically for a list of names" do
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq 200
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end

    it "returns 200 with names sorted alphabetically for a different list of names" do
      response = post("/sort-names", names: "Ahmed,Sara,Karolina,Tay,Shaun")

      expect(response.status).to eq 200
      expect(response.body).to eq "Ahmed,Karolina,Sara,Shaun,Tay"
    end
  end

  context "GET to /hello" do
    it "returns html header" do
      response = get("/hello")

      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Hello!</h1>")
    end
  end
end
