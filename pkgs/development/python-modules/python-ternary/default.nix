{ lib, buildPythonPackage, fetchPypi, matplotlib, pytestCheckHook }:

buildPythonPackage rec {
  pname = "python-ternary";
  version = "1.0.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "41e7313db74ab2e24280797ed8073eccad4006429dfd87f6e66e7feba2aa64cd";
  };

  propagatedBuildInputs = [ matplotlib ];

  checkInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [ "ternary" ];

  meta = with lib; {
    description = "Make ternary plots in python with matplotlib";
    homepage = "https://github.com/marcharper/python-ternary";
    license = licenses.mit;
    maintainers = with maintainers; [ nialov ];
  };
}
