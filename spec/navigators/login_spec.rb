require 'spec_helper'

describe Login do

  # it "should login successfully", navigating: 'login' do
  #   navigate(company_rut:"",)
  # end
  it "should login successfully", live:true do
    navigate(company_rut: ENV['COMPANY_RUT'], rut: ENV['RUT'], password: ENV['PASSWORD'])
    expect(browser.url.include? 'privado').to be(true)
  end

end
