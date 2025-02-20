```julia
function myfunction(x)
  if x > 0
    return x^2
  else
    return abs(x)^2
  end
 end

println(myfunction(2))
println(myfunction(-2))

#Alternative solution using a more robust approach:
function safe_power(x, y)
  if y == 0
    return 1
  elseif x == 0 && y < 0
    throw(DomainError(x, "Cannot raise 0 to a negative power."))
  elseif x < 0 && mod(y,1) != 0
    return (abs(x))^y * (ifelse(isodd(Int(y)), -1, 1))
  else
    return x^y
  end
 end
println(safe_power(-2,2))
println(safe_power(-2, 2.5))
```