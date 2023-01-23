from pathlib import Path
from tempfile import TemporaryDirectory

from ..create_landing_zone_file import (UserInputs, generate_account_file)

TEMPLATE_FILE_PATH = Path(__file__).parent.parent.parent / "scripts" / "module_template.tf"
EXPECTED_OUTPUT_PATH = Path(__file__).parent / "expected_outputs" / "expected_module_template.tf"


def test_generate_account_file():
    with TemporaryDirectory() as temp_dir:
        user_inputs = UserInputs("email@email.com", "kukuriku", "kuku", "riku")
        generate_account_file(user_inputs, template_file_path=TEMPLATE_FILE_PATH, output_file_dir=Path(temp_dir))
        actual = (Path(temp_dir) / f"{user_inputs.account_name}.tf").read_text()
        expected = EXPECTED_OUTPUT_PATH.read_text()
        assert actual == expected
