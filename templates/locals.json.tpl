{
    "env": "${lower(env)}",
    "customer_prefix": "${lower(customer_prefix)}",
    "project": "${lower(project)}",
    "application": "${lower(application)}",
    "custom_name": "${lower(custom_name)}",
    "name_prefix": "${lower(join(s,[customer_prefix, env, location_code]))}${s}${length(custom_name) > 0 ? lower(join(s, [application, custom_name])) : lower(application) }",
    "global_tags": {
      "Application": "${application}",
      "Project": "${project}",
      "Environment": "${upper(env)}",
      %{~ if length (costcenter)>0 ~}"Cost Center": "${costcenter}",%{~ endif ~}
      "SourceVersion": "${module_version}"
    }
}