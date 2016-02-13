require 'date'
class CuentaCorrienteReducer < Crabfarm::BaseReducer

  has_array :transactions

  def run
    rows = self.search('tr')
    rows = rows.to_a
    rows.shift
    rows.each do |r|
      begin
      t = Transaction.new()
      t.amount = t.signed_amount(r.search("td:nth-child(5)").text.gsub(/[\.]/,""),r.search("td:nth-child(6)").text.gsub(/[\.]/,""))
      t.description = r.search("td:nth-child(2)").text
      t.date = Date.parse(r.search("td:nth-child(1)").text)
      t.balance = r.search("td:nth-child(7)").text.gsub(/[\.]/,"")
      self.transactions.push(t)
    rescue
      binding.pry
    end

    end
  end

end

