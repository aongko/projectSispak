package gui;

import javax.swing.JFrame;
import javax.swing.JPanel;

import jess.Context;
import jess.JessException;
import jess.Rete;

public class Main extends JFrame {
	private JPanel wrapper;
	
	private Rete rete;
	
	private String flightClass;
	private int budget;
	private String origin;
	private String destination;
	private String departureDate;
	private int ticketNumber;
	
	public Main(Context context,
				String flightClass,
				int budget,
				String origin,
				String destination,
				String departureDate,
				int ticketNumber
			) throws JessException {
		//init
		
		this.rete = context.getEngine();
		this.flightClass = flightClass;
		this.budget = budget;
		this.origin = origin;
		this.destination = destination;
		this.departureDate = departureDate;
		this.ticketNumber = ticketNumber;
		
		System.out.println(flightClass + " " + budget + " " + origin + " " + destination + " " + departureDate + " " + ticketNumber);
		String[] airplanes;
		if (flightClass.equals("Domestic")) {
			airplanes = new String[]{"Citilink", "Indonesia Air Asia", "Lion Air", "Mandala Airlines"};
		}
		else {
			airplanes = new String[]{"Garuda Indonesia", "Sriwijaya Air"};
		}
		
		setTitle("The Result of Simulation");
		this.setSize(800, 600);
		this.setLocationRelativeTo(null);
		//this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		MainPanel mp = new MainPanel(
			this.budget,
			this.origin,
			this.destination,
			this.departureDate,
			airplanes,
			this.rete
		);
		
		wrapper = new JPanel();
		wrapper.add(mp);
		wrapper.setLayout(null);
		this.add(wrapper);
		//this.pack();
		this.setVisible(true);
		
	}
}
