# x'' + 13x' + 0.5x = 0.8sin(9t)
using DifferentialEquations

function lorenz!(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 0.8*sin(9*t)
end

const x = 0.5
const y = -1.5
u0 = [x, y]

p = (13, 0.5)
tspan = (0.0, 61.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("lab4_julia_3.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("lab4_julia_3_phase.png")

