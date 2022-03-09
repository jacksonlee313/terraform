provider "test" {
  value = "ok"
}

module "mod" {
  source = "./mod"
}

# FIXME: This test case seems a little suspicious, because this module is
# letting its module.mod inherit the test provider configuration in a way
# that would typically be valid, but yet we are presenting a warning for it
# just because the _child_ module explicitly passes it to its own child
# (our grandchild). It's not clear why this particular case warrants a warning
# but we allow automatic inheritance with no warnings in most other cases.
