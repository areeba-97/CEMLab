include("./../../NumericalIntegration/NumericalIntegration.jl")
using .NumericalIntegration

##
#homework 3

f(x) = x^4
a = 0.0
b = 1.0
F_analytical = 1/5

rules = [("Midpoint", Midpoint()), ("Trapezoidal", Trapezoidal()), ("Simpson", Simpson())]

for (name, rule) in rules
    println("$name Rule:")
    error_previous = NaN
    for n in [1, 2, 4, 8, 16, 32, 64]
        intrule_composite = CompositeNewtonCotes(n, rule)
        F_composite = intrule_composite(f, a, b)
        error_composite = abs(F_composite - F_analytical)
        # n doubles each step, so h halves: ratio ≈ 2^p for a rule of order p
        ratio = error_previous / error_composite
        println("  n=$n, h=$((b - a) / n): F = $F_composite, Error = $error_composite, Ratio = $ratio")
        error_previous = error_composite
    end
end
