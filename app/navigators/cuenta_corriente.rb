class CuentaCorriente < Crabfarm::BaseNavigator

  def run
    # Add some navigation code here.
    browser.goto frame: "[name=menu]"
    browser.search("[name=sub15]").click()
    browser.search("[name=sub16]").click()
    browser.goto frame: :top
    browser.goto frame: "[name=CONTENT]"
    browser.search("#btnSeleccionarCuenta").click()
    browser.search('table#cartolaMovimientos').wait(:present).wait { |b| b.search('tr').count > 2 }
    reduce_with_defaults(browser.search('table#cartolaMovimientos').wait(:present,timeout:30.0))
  end

end

