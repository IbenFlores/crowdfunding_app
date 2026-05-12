Donation.destroy_all
Project.destroy_all
User.destroy_all

user = User.create!(
  email_address: "estudiante@lasalle.edu.pe",
  password: "password123",
  preferred_currency: "USD"
)

project = Project.create!(
  title: "Programa de Educación Tecnológica",
  description: "Campaña de recaudación para proveer recursos a estudiantes de Ingeniería de Software en Arequipa.",
  goal_amount: 5000.00,
  base_currency: "PEN"
)

processor = DonationProcessor.new(
  project, 
  user, 
  { original_amount: 50.0, original_currency: "USD", transaction_code: "DON-12345A" }
)
processor.process!