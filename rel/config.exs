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
  set cookie: :"jD]nDmTB1G)/zgCl2p6&zxunX`U2*%pG)7oEWq^PWC9p&X0H{EZmt84J)o}d*}l?"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"WGwx81xLwglOw[%g@yb`EJ{7=%4yjN/&my@YY~s}0bZBgJqSd;oaNCq&dRFWD:ee"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :marvelous do
  set version: current_version(:marvelous)
end

