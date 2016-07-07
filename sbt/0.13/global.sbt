shellPrompt := { state =>
  "%s> ".format(Project.extract(state).currentProject.id)
}
