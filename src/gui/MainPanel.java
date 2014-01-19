package gui;

import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.BoxLayout;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;

import jess.JessException;
import jess.QueryResult;
import jess.Rete;
import jess.ValueVector;

public class MainPanel extends JPanel{
	private JPanel panelBudget, panelOrigin, panelDestination;
	private JLabel lblBudget, lblBudgetValue;
	private JLabel lblOrigin, lblDestination;
	private JComboBox cmbOrigin, cmbDestination;
	private JLabel[] lblPlanes;
	private JTextArea[] txtPlanes;
	private JLabel lblLowestFare;
	private JTextArea txtLowestFare;
	
	private int budgetValue;
	private String originValue;
	private String destinationValue;
	private String departureDate;
	private String[] airplanes;
	private Rete rete;
	
	private int airplaneIndexing;
	private String lowestFareAirplane;
	private int lowestAirplaneIdx;
	private int currLowest;
	
	public MainPanel(int budgetValue,
					String originValue,
					String destinationValue,
					String departureDate,
					String[] airplanes,
					Rete rete
					) throws JessException {
		this.budgetValue = budgetValue;
		this.originValue = originValue;
		this.destinationValue = destinationValue;
		this.departureDate = departureDate;
		this.airplanes = airplanes;
		this.rete = rete;
		
		this.setBounds(50, 10, 500, 500);
		this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		
		lblBudget = new JLabel("Budget :");
		lblBudgetValue = new JLabel("Rp." + budgetValue);
		
		lblOrigin = new JLabel("Origin :");
		lblDestination = new JLabel("Destination :");
		
		cmbOrigin = new JComboBox();
		cmbOrigin.addItem(originValue);
		cmbOrigin.setEnabled(false);
		
		cmbDestination = new JComboBox();
		cmbDestination.addItem(destinationValue);
		cmbDestination.setEnabled(false);
		
		panelBudget = new JPanel(new GridLayout(1, 2));
		panelOrigin = new JPanel(new GridLayout(1, 2));
		panelDestination = new JPanel(new GridLayout(1, 2));
		
		panelBudget.add(lblBudget);
		panelBudget.add(lblBudgetValue);
		
		panelOrigin.add(lblOrigin);
		panelOrigin.add(cmbOrigin);
		
		panelDestination.add(lblDestination);
		panelDestination.add(cmbDestination);
		
		this.add(panelBudget);
		this.add(panelOrigin);
		this.add(panelDestination);

		lblPlanes = new JLabel[airplanes.length];
		txtPlanes = new JTextArea[airplanes.length];
		
		airplaneIndexing = 0;
		lowestAirplaneIdx = -1;
		currLowest = 0;
		
		for (int i = 0; i < airplanes.length; i++) {
			JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
			lblPlanes[i] = new JLabel(airplanes[i]);
			txtPlanes[i] = new JTextArea();
			
			boolean ada = this.initTxtPlane(txtPlanes[i], this.generateDefqueryName(airplanes[i]), airplanes[i]);
			if (!ada) {
				txtPlanes[i].setEnabled(false);
			}
			txtPlanes[i].setEditable(false);
			
			panel.add(lblPlanes[i]);
			this.add(panel);
			this.add(txtPlanes[i]);
		}
		
		lblLowestFare = new JLabel("Lowest Fare :");
		txtLowestFare = new JTextArea();

		txtLowestFare.setEditable(false);
		if (lowestAirplaneIdx == -1) {
			txtLowestFare.setText("No Available Plane");
		}
		else {
			txtLowestFare.setText(this.lowestFareAirplane + " No: " + this.lowestAirplaneIdx);
		}
		JPanel panelTmp = new JPanel(new FlowLayout(FlowLayout.LEFT));
		panelTmp.add(lblLowestFare);
		
		this.add(panelTmp);
		this.add(txtLowestFare);
	}
	
	private String generateDefqueryName(String airplaneName) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("query-");
		
		String lowerName = airplaneName.toLowerCase();
		
		for (int i = 0; i < airplaneName.length(); i++) {
			if (lowerName.charAt(i) == ' ') {
				sb.append('-');
			}
			else sb.append(lowerName.charAt(i));
		}
		return sb.toString();
	}
	private boolean initTxtPlane(JTextArea txt, String defqueryName, String originalName) throws JessException {		
		ValueVector vv = new ValueVector();
		
		vv.add(this.budgetValue);
		vv.add(this.originValue);
		vv.add(this.destinationValue);
		vv.add(this.departureDate);
		
		StringBuilder sb = new StringBuilder();
		QueryResult solution = this.rete.runQueryStar(defqueryName, vv);
		
		while(solution.next()) {
			airplaneIndexing++;
			sb.append(airplaneIndexing + ". " + solution.getString("class") + " => " + "Rp. " + solution.getInt("price") + "\n");
			
			if (lowestAirplaneIdx == -1 || solution.getInt("price") < currLowest) {
				currLowest = solution.getInt("price");
				lowestAirplaneIdx = airplaneIndexing;
				lowestFareAirplane = originalName;
			}
		}
		txt.setText(sb.toString());
		return !sb.toString().equals("");
	}
}
