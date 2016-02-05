require 'date'
class CuentaCorrienteReducer < Crabfarm::BaseReducer

  has_array :transactions

  def run
    rows = search('#cartolaMovimientos tr')
    rows = rows.to_a
    rows.shift
    rows.pop
    rows = [rows.first]
    rows.each do |r|
      t = Transaction.new()
      t.amount = r.search("td:nth-child(5)").text.gsub(/[\.]/,"")
      t.description = r.search("td:nth-child(2)").text
      t.date = Date.parse(r.search("td:nth-child(1)").text)
      t.balance = r.search("td:nth-child(7)").text.gsub(/[\.]/,"")
      self.transactions.push(t)
    end
  end

end

