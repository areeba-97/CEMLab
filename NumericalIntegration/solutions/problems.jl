include("./../../NumericalIntegration/NumericalIntegration.jl")
using .NumericalIntegration

##
#prblem 2

f(x) = x^2
a =0.0
b =1.0
F_analytical = 1/3


intrule_midpoint = Midpoint()
F_midpoint = intrule_midpoint(f, a, b)

relerror_midpoint = abs(F_midpoint - F_analytical) / abs(F_analytical)
println("Midpoint Rule: F_midpoint = $F_midpoint, Relative Error = $relerror_midpoint")
##

#problem 4

for n in [1,2,4,8]
    intrule_composite = CompositeNewtonCotes(n, Midpoint())
    F_composite = intrule_composite(f, a, b)
    relerror_composite = abs(F_composite - F_analytical) / abs(F_analytical)
    println("Composite Midpoint Rule with n=$n: F_composite = $F_composite, Relative Error = $relerror_composite")
end
