require 'spec_helper'

describe CuentaCorrienteReducer, reducing:'conta', live:true do

  it "should have a 'transactions' array" do
    expect(reducer.transactions).to be_instance_of(Array)
  end

  it "should return transactions" do
    expect(reducer.transactions.first).to be_instance_of(Transaction)
  end

  it "should return transactions with information" do
    expect(reducer.transactions.first.amount).not_to be_nil
  end

  it "should return a transaction with a valid amount" do
    expect(reducer.transactions.first.amount).to be_between(-100000000,100000000)
  end

  it "should return a transaction with a valid description" do
    expect(reducer.transactions.first.description).to match("[A-Za-z]+")
  end

  it "should return a transaction with a valid date" do
    expect(reducer.transactions.first.date).to be_instance_of(Date)
  end

  it "should return a transaction with a valid balance" do
    expect(reducer.transactions.first.balance).to be  > 0
  end
end
