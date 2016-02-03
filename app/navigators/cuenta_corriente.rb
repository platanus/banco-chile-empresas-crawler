class CuentaCorriente < Crabfarm::BaseNavigator

  def run
    # Add some navigation code here.
    browser.goto frame: "[name=menu]"
    browser.search("[name=sub15]").click()
    browser.search("[name=sub16]").click()
    browser.goto frame: :top
    browser.goto frame: "[name=CONTENT]"
    browser.search("#btnSeleccionarCuenta").click()
    reduce_with_defaults
  end

end

