class Login < Crabfarm::BaseNavigator

  def run
    browser.goto 'https://www.empresas.bancochile.cl/cgi-bin/navega?pagina=enlinea/login_fus'
    company_rut = params[:company_rut].chop()
    company_digit = params[:company_rut].slice(params[:company_rut].length-1)
    owner_rut = params[:rut].chop()
    owner_digit = params[:rut].slice(params[:rut].length-1)
    browser.search("[name=rut_emp]").set(company_rut)
    browser.search("[name=dv_emp]").set(company_digit)
    browser.search("[name=rut_apo]").set(owner_rut)
    browser.search("[name=dv_apo]").set(owner_digit)
    browser.search("[name=pin]").set(params[:password])
    browser.search(".btn_amarillodegrade").click()
    for i in 0..1000
      break if browser.url.include? 'privado'
      sleep 0.005
    end
  end

end

