from fpdf import FPDF

class ShirtificateGenerator:
    def __init__(self, name, output_path="shirtificate.pdf"):
        self.name = name
        self.output_path = output_path

    def create_pdf(self):
        pdf = FPDF()
        pdf.add_page()

        pdf.set_font("helvetica", "B", 45)
        pdf.cell(0, 60, "CS50 Shirtificate", align="C")

        pdf.image("shirtificate.png", x=0, y=70)

        pdf.set_font_size(30)
        pdf.set_text_color(255, 255, 255)
        pdf.text(x=45, y=140, txt=f"{self.name} took CS50")

        pdf.output(self.output_path)

if __name__ == "__main__":
    name = input("Name: ")
    shirtificate = ShirtificateGenerator(name)
    shirtificate.create_pdf()
