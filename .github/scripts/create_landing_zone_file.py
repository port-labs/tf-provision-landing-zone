import argparse
import sys
from dataclasses import dataclass, asdict
from pathlib import Path

import jinja2

FILE_OUTPUT_PATH = Path(__file__).parents[2]
TEMPLATE_FILE_NAME = 'module_template.tf'
TEMPLATE_FILE_PATH = Path(FILE_OUTPUT_PATH, '.github', 'scripts', TEMPLATE_FILE_NAME)
OUTPUT_FILE_DIR = Path(FILE_OUTPUT_PATH) / 'terraform'


@dataclass
class UserInputs:
    email: str
    account_name: str
    first_name: str
    last_name: str

    @staticmethod
    def from_argparse_namespace(args):
        return UserInputs(email=args.email,
                          account_name=args.account_name,
                          first_name=args.first_name,
                          last_name=args.last_name)

    def as_dict(self):
        return asdict(self)


def main():
    args = parse_external_arguments()
    generate_account_file(args, template_file_path=TEMPLATE_FILE_PATH, output_file_dir=OUTPUT_FILE_DIR)


def parse_external_arguments():
    parser = argparse.ArgumentParser(
        description='Create a new landing zone module .tf file based on template and provided inputs')
    parser.add_argument('email', help='New account email')
    parser.add_argument('account_name', help='New account name')
    parser.add_argument('first_name', help='New account SSO user first name')
    parser.add_argument('last_name', help='New account SSO user last name')
    args = parser.parse_args()
    return args


def generate_account_file(args, template_file_path, output_file_dir):
    user_inputs = UserInputs.from_argparse_namespace(args)
    template_file_content = template_file_path.read_text()
    updated_content = apply_user_input_to_template(template_file_content, user_inputs)
    write_new_account_file(user_inputs.account_name, updated_content, path=output_file_dir)


def apply_user_input_to_template(base_content: str, user_inputs):
    environment = jinja2.Environment()
    template = environment.from_string(base_content)
    return template.render(**user_inputs.as_dict())


def write_new_account_file(account_name, updated_content, path):
    output_file_name = f'{sanitize_account_name(account_name)}.tf'
    complete_output_path = path / output_file_name
    complete_output_path.write_text(updated_content)


def sanitize_account_name(account_name: str):
    return account_name.replace(' ', '-').replace(':', '-')


if __name__ == '__main__':
    sys.exit(main())
