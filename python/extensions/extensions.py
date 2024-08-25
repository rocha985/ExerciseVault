def get_file_extension(file_name):
    if '.' not in file_name:
        return None
    _, file_extension = file_name.rsplit('.', 1)
    return '.' + file_extension


def get_mime_type(file_extension):
    extension_to_mime = {
        ".gif": "image/gif",
        ".jpg": "image/jpeg",
        ".jpeg": "image/jpeg",
        ".png": "image/png",
        ".pdf": "application/pdf",
        ".txt": "text/plain",
        ".zip": "application/zip"
    }

    default_mime_type = "application/octet-stream"

    if file_extension is None:
        return default_mime_type
    else:
        return extension_to_mime.get(file_extension, default_mime_type)


def main():
    filename = input("File name: ").lower().strip()
    file_extension = get_file_extension(filename)
    mime_type = get_mime_type(file_extension)
    print(mime_type)


main()
