class Login < Crabfarm::BaseNavigator

  def run
    browser.goto 'https://www.empresas.bancochile.cl/cgi-bin/navega?pagina=enlinea/login_fus'
    company_rut = params[:company_rut].chop()
    company_digit = params[:company_rut].slice(params[:company_rut].length-1)
    owner_rut = params[:rut].chop()
    owner_digit = params[:rut].slice(params[:rut].length-1)
    browser.css("[name=rut_emp]").set(company_rut)
    browser.css("[name=dv_emp]").set(company_digit)
    browser.css("[name=rut_apo]").set(owner_rut)
    browser.css("[name=dv_apo]").set(owner_digit)
    browser.css("[name=pin]").set(params[:password])
    browser.css(".btn_amarillodegrade").click()
    reduce_with_defaults
  end

end

