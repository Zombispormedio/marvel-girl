use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"G]m`SO/e0qcvxu*:w&[6r@LvdJ?RcegUM%6}=KZPBlzl5je}sn^l?HcmL.<q2k3}"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"?LzLTmR`dDkzf*m;9<v|H6H&wgTX54{a]HS7`w]lDjlCVeh8A7*6[6O?n<PM_~HW"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :marvelous do
  set version: current_version(:marvelous)
end

