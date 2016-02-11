require 'spec_helper'

describe CuentaCorriente do

  before do
    navigate(:login, company_rut: ENV['COMPANY_RUT'], rut: ENV['RUT'], password: ENV['PASSWORD'])
  end
  let!(:reducer) {spy_reducer CuentaCorrienteReducer}
  it "should get the balance sheet" do
    navigate
    expect(reducer.target.text).to include("Fecha Descripción Documento Canal o Sucursal Cargos Abonos Saldo")
  end


end
