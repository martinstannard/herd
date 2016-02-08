# Herd

A GenServer test for managing students

## Usage

```elixir
iex(5)> {:ok, reg} = Herd.StudentRegistry.start_link
{:ok, #PID<0.141.0>}
iex(6)> Herd.StudentRegistry.create(reg, "toby")    
{:ok, #PID<0.143.0>}
iex(7)> Herd.StudentRegistry.create(reg, "toby")    
:error
iex(8)> Herd.StudentRegistry.create(reg, "toby1")
{:ok, #PID<0.146.0>}
iex(9)> {:ok, s} = Herd.StudentRegistry.create(reg, "toby2")  
{:ok, #PID<0.148.0>}
iex(10)> Herd.Student.eggs(s)
0
iex(11)> Herd.Student.award_eggs(s, 100)
:ok
iex(12)> Herd.Student.eggs(s)           
100
iex(13)> Herd.Student.award_eggs(s, 100)
:ok
iex(14)> Herd.Student.eggs(s)           
200
iex(15)> 
```
