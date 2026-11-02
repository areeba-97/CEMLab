using FastGaussQuadrature

##
#problem 6

struct GaussLegendre{F} <: IntegrationRule
    points::Vector{F}
    weights::Vector{F}
end

function GaussLegendre(; order::Int=3)
    x, w = gausslegendre(order)
    return GaussLegendre(x, w)
end

##
#problem 8
function (rule::GaussLegendre)(f::Function, a::F, b::F) where {F}
    return (b-a)/2 * dot(rule.weights, f.((b-a)/2 .* rule.points .+ (a+b)/2))
end
