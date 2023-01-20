import os
import sys
import argparse
from pathlib import Path

FILE_OUTPUT_PATH = Path(__file__).parents[2]
TEMPLATE_FILE_NAME = 'module_template.tf'
TEMPLATE_FILE_PATH = os.path.join(FILE_OUTPUT_PATH, '.github', 'scripts', TEMPLATE_FILE_NAME)
PLACEHOLDERS = [
    "ACCOUNT_EMAIL_PH",
    "ACCOUNT_NAME_PH",
    "SSO_FIRST_NAME_PH",
    "SSO_LAST_NAME_PH"
]


def sanitize_account_name(account_name: str):
    return account_name.replace(' ', '-').replace(':', '-')


def read_template_file():
    file_content = None
    with open(TEMPLATE_FILE_PATH, 'r') as f:
        file_content = f.read()
    return file_content


def print_inputs(email, name, first_name, last_name):
    print(f'Received inputs:')
    print(f'email: {email}')
    print(f'account name: {name}')
    print(f'first name: {first_name}')
    print(f'last name: {last_name}')


def update_file_with_inputs(base_content: str, inputs):
    updated_content = base_content
    for placeholder, input in zip(PLACEHOLDERS, inputs):
        updated_content = updated_content.replace(placeholder, input)
    return updated_content


def output_new_content_file(account_name, updated_content):
    with open(f'{sanitize_account_name(account_name)}.tf', 'w') as f:
        f.write(updated_content)


def main():
    parser = argparse.ArgumentParser(description='Create a new landing zone module .tf file based on template and provided inputs')
    parser.add_argument('email', help='New account email')
    parser.add_argument('name', help='New account name')
    parser.add_argument('first', help='New account SSO user first name')
    parser.add_argument('last', help='New account SSO user last name')
    args = parser.parse_args()
    email = args.email
    account_name = args.name
    first_name = args.first
    last_name = args.last
    print_inputs(email, account_name, first_name, last_name)
    template_file_content = read_template_file()
    updated_content = update_file_with_inputs(template_file_content, [email, account_name, first_name, last_name])
    output_new_content_file(account_name, updated_content)


if __name__ == '__main__':
    sys.exit(main())
