#problem 1
abstract type NewtonCotesRule end
struct Midpoint <: NewtonCotesRule end

function (::Midpoint)(f::Function, a::T, b::T) where {T}
    return (b - a) * f((a + b) / 2)
end

struct Trapezoidal <: NewtonCotesRule end

function (::Trapezoidal)(f::Function, a::T, b::T) where {T}
    return (b - a) / 2 * (f(a) + f(b))
end

struct Simpson <: NewtonCotesRule end

function (::Simpson)(f::Function, a::T, b::T) where {T}
    return (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b))
end

#problem 3

struct CompositeNewtonCotes <: IntegrationRule
    nsubintervals::Int
    rule::NewtonCotesRule

end

function (intrule::CompositeNewtonCotes)(f::Function, a::T, b::T) where {T}
    n = intrule.nsubintervals
    h = (b - a) / n
    F = 0.0
    for i in 0:(n-1)
        F += intrule.rule(f, a + i*h, a + (i+1)*h)
    end

    return F
end
