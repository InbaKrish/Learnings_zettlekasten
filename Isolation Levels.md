---
tags:
  - SystemDesign/Databases
---
## Repeatable Reads

-> Repeat same read value under a transaction even if the value gets updated (committed), in a parallel transaction.

**Postgresql** along with dirty reads, also prevents the phantom reads via the Repeatable Read tran 
## Read Committed

-> Within a transaction the updated value gets read, if any parallel transaction commits the update. So there may be inconsistent reads within a transaction based on parallel transaction commits.
```ruby
# T1
Account.transaction(isolation: :read_committed) do
  account = Account.find(1)
  account.update(balance: 1000)
  puts "Transaction 1: Balance updated to 1000, but not yet committed."

  Thread.new do
    # T2
    Account.transaction(isolation: :read_committed) do
      puts "Transaction 2: Current balance (Read Committed) is #{Account.find(1).balance}"
    end
  end.join

  sleep(3)
end

puts "Outside Transactions: Final balance is #{Account.find(1).balance}"

#=> Transaction 1: Balance updated to 1000, but not yet committed.
#=> Transaction 2: Current balance (Read Committed) is 500
#=> Outside Transactions: Final balance is 1000.0
```
**PostgreSQL's default**
## Read Uncommitted (Dirty reads)

-> Reads uncommitted values updated in other parallel transactions.

**Note: Not supported in Postgresql**
## Serializable (Stritght)

Locks the read of a row on other transactions, until the transaction gets committed/rolled back.