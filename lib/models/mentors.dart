class Mentor {
  final int id, price;
  final String title, description, image;

  Mentor({required this.id, required this.price, required this.title, required this.description, required this.image});
}

List<Mentor> mentors = [
  Mentor(
      id: 1,
      price: 5000,
      title: "Elon Musk",
      image: "assets/images/Screenshot_2022-06-15_at_15.39.42-removebg-preview.png",
      description:
      'Elon is the founder, CEO, and Chief Engineer at SpaceX; angel investor, CEO, and Product Architect of Tesla, Inc'
  ),
  Mentor(
      id: 4,
      price: 10000,
      title: "Gary Vee",
      image: "assets/images/Screenshot_2022-06-15_at_15.34.46-removebg-preview.png",
      description:
      'Gary Vaynerchuk is the chairman of VaynerX, a modern-day media and communications holding company, and the active CEO of VaynerMedia, a full-service advertising agency servicing Fortune 100 clients across the company’s 5 locations. '
  ),
  Mentor(
      id: 9,
      price: 8999,
      title: "Warren Buffett",
      image: "assets/images/Screenshot_2022-06-15_at_15.38.16-removebg-preview.png",
      description:
      'Warren Buffett is currently the chairman and CEO of Berkshire Hathaway. He is one of the most successful investors in the world'
  ),
];