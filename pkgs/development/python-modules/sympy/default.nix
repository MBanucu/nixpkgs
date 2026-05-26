{
  lib,
  buildPythonPackage,
  fetchPypi,
  mpmath,
  setuptools,

  # Reverse dependency
  sage,
}:

buildPythonPackage (finalAttrs: {
  pname = "sympy";
  version = "1.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-09P+jfHloLQvDnvfUFQWl9vn0jdG6JSZDAMOKwXnJRc=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "mpmath"
  ];

  dependencies = [ mpmath ];

  # tests take ~1h
  doCheck = false;
  pythonImportsCheck = [ "sympy" ];

  passthru.tests = {
    inherit sage;
  };

  meta = {
    description = "Python library for symbolic mathematics";
    mainProgram = "isympy";
    homepage = "https://www.sympy.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    teams = [ lib.teams.sage ];
  };
})
