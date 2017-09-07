mutable struct DEOptions{absType,relType,tTypeNoUnits,tType,F2,F3,F4,F5,F6,tstopsType,discType,ECType,SType,MI}
  maxiters::MI
  timeseries_steps::Int
  save_everystep::Bool
  adaptive::Bool
  abstol::absType
  reltol::relType
  gamma::tTypeNoUnits
  qmax::tTypeNoUnits
  qmin::tTypeNoUnits
  qsteady_max::tTypeNoUnits
  qsteady_min::tTypeNoUnits
  failfactor::tTypeNoUnits
  dtmax::tType
  dtmin::tType
  internalnorm::F2
  save_idxs::SType
  tstops::tstopsType
  saveat::tstopsType
  d_discontinuities::discType
  userdata::ECType
  progress::Bool
  progress_steps::Int
  progress_name::String
  progress_message::F5
  timeseries_errors::Bool
  dense_errors::Bool
  beta1::tTypeNoUnits
  beta2::tTypeNoUnits
  qoldinit::tTypeNoUnits
  dense::Bool
  save_start::Bool
  callback::F3
  isoutofdomain::F4
  unstable_check::F6
  verbose::Bool
  calck::Bool
  force_dtmin::Bool
  advance_to_tstop::Bool
  stop_at_next_tstop::Bool
end

mutable struct ODEIntegrator{algType<:OrdinaryDiffEqAlgorithm,uType,tType,tTypeNoUnits,tdirType,ksEltype,SolType,F,ProgressType,CacheType,O,FSALType} <: AbstractODEIntegrator
  sol::SolType
  u::uType
  k::ksEltype
  t::tType
  dt::tType
  f::F
  uprev::uType
  uprev2::uType
  tprev::tType
  alg::algType
  notsaveat_idxs::Vector{Int}
  dtcache::tType
  dtchangeable::Bool
  dtpropose::tType
  tdir::tdirType
  EEst::tTypeNoUnits
  qold::tTypeNoUnits
  q11::tTypeNoUnits
  erracc::tTypeNoUnits
  dtacc::tTypeNoUnits
  success_iter::Int
  iter::Int
  saveiter::Int
  saveiter_dense::Int
  prog::ProgressType
  cache::CacheType
  kshortsize::Int
  force_stepfail::Bool
  last_stepfail::Bool
  just_hit_tstop::Bool
  accept_step::Bool
  isout::Bool
  reeval_fsal::Bool
  u_modified::Bool
  opts::O
  fsalfirst::FSALType
  fsallast::FSALType

  function (::Type{ODEIntegrator{algType,uType,tType,tTypeNoUnits,tdirType,ksEltype,SolType,
                F,ProgressType,CacheType,O,FSALType}}){algType,uType,tType,tTypeNoUnits,tdirType,ksEltype,SolType,
                F,ProgressType,CacheType,O,FSALType}(
                sol,u,k,t,dt,f,uprev,uprev2,tprev,
      alg,notsaveat_idxs,dtcache,dtchangeable,dtpropose,tdir,
      EEst,qold,q11,erracc,dtacc,success_iter,
      iter,saveiter,saveiter_dense,prog,cache,
      kshortsize,force_stepfail,last_stepfail,just_hit_tstop,
      accept_step,isout,reeval_fsal,u_modified,opts)

      new{algType,uType,tType,tTypeNoUnits,tdirType,ksEltype,SolType,
                  F,ProgressType,CacheType,O,FSALType}(
                  sol,u,k,t,dt,f,uprev,uprev2,tprev,
      alg,notsaveat_idxs,dtcache,dtchangeable,dtpropose,tdir,
      EEst,qold,q11,erracc,dtacc,success_iter,
      iter,saveiter,saveiter_dense,prog,cache,
      kshortsize,force_stepfail,last_stepfail,just_hit_tstop,
      accept_step,isout,reeval_fsal,u_modified,opts) # Leave off fsalfirst and last
  end
end

# When this is changed, DelayDiffEq.jl must be changed as well!
