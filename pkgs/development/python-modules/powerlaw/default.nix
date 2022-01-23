{ lib, buildPythonPackage, fetchFromGitHub, scipy, numpy, matplotlib, mpmath,
pytest }:

buildPythonPackage rec {
  pname = "powerlaw";
  version = "1.5";

  src = fetchFromGitHub {
    owner = "jeffalstott";
    repo = "powerlaw";
    # The version at this rev should be aligned to the one at pypi according
    # to the commit message.
    rev = "6732699d790edbe27c2790bf22c3ef7355d2b07e";
    sha256 = "sha256-x3jXk+xOQpIeEGlzYqNwuZNPpkesF0IOX8gUhhwHk5Q=";
  };

  propagatedBuildInputs = [ scipy numpy matplotlib mpmath ];

  checkInputs = [
    pytest
  ];

  # pytest is not actually used by the package for tests, it uses
  # unittest instead. However pytest can run all unittest cases
  # so I've just used pytest to run them with ease.
  # Tests use local files which are relative to the testing directory
  # so a cd into the testing directory was necessary for successful
  # tests.
  checkPhase = ''
    cd testing
    pytest
  '';

  pythonImportsCheck = [ "powerlaw" ];

  meta = with lib; {
    description = "Toolbox for testing if a probability distribution fits a power law";
    homepage = "http://www.github.com/jeffalstott/powerlaw";
    license = licenses.mit;
    maintainers = with maintainers; [ nialov ];
  };
}
