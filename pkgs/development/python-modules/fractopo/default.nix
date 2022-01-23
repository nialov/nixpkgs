{ lib
, buildPythonPackage
, fetchFromGitHub
, geopandas
, pygeos
, pandas
, shapely
, numpy
, scipy
, powerlaw
, python-ternary
, scikit-learn
, seaborn
, matplotlib
, click
, rich
, typer
, poetry
, hypothesis
, pytestCheckHook
, pytest-regressions
}:

buildPythonPackage rec {
  pname = "fractopo";
  version = "0.2.5";
  format = "pyproject";

  # Tests are contained in the GitHub repo but not pypi
  src = fetchFromGitHub {
    owner = "nialov";
    repo = "fractopo";
    rev = "v${version}";
    sha256 = "sha256-P4Hgm3vQGZhIFPztQnlI52s2PXj1cSIyNvpMPYMbdKg=";
  };

  # Uses poetry for install
  nativeBuildInputs = [ poetry ];

  propagatedBuildInputs = [
    geopandas
    pygeos
    pandas
    shapely
    numpy
    scipy
    powerlaw
    python-ternary
    scikit-learn
    seaborn
    matplotlib
    click
    rich
    typer
  ];

  checkInputs = [
    pytestCheckHook
    hypothesis
    pytest-regressions
  ];

  pythonImportsCheck = [ "fractopo" ];

  meta = with lib; {
    description = "fractopo is a Python package with tools for validating and analyzing lineament and fracture trace maps";
    homepage = "github.com/nialov/fractopo";
    license = licenses.mit;
    maintainers = with maintainers; [ nialov ];
  };
}
