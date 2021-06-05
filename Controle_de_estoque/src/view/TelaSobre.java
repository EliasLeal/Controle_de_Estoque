package view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Toolkit;
import javax.swing.JLabel;
import javax.swing.ImageIcon;

public class TelaSobre extends JDialog {

	private final JPanel contentPanel = new JPanel();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			TelaSobre dialog = new TelaSobre();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public TelaSobre() {
		setModal(true);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setResizable(false);
		setIconImage(Toolkit.getDefaultToolkit().getImage(TelaSobre.class.getResource("/icones/pc.png")));
		setTitle("Sobre");
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		{
			JLabel lblNewLabel = new JLabel("Sistema de Controle de estoque");
			lblNewLabel.setBounds(31, 24, 193, 14);
			contentPanel.add(lblNewLabel);
		}
		{
			JLabel lblNewLabel_1 = new JLabel("Autor: Elias Leal");
			lblNewLabel_1.setBounds(31, 62, 112, 14);
			contentPanel.add(lblNewLabel_1);
		}
		{
			JLabel lblNewLabel_2 = new JLabel("Vers\u00E3o 1.0");
			lblNewLabel_2.setBounds(31, 87, 81, 14);
			contentPanel.add(lblNewLabel_2);
		}
		{
			JLabel lblNewLabel_3 = new JLabel("Sob a Licen\u00E7a GPL");
			lblNewLabel_3.setBounds(31, 112, 153, 14);
			contentPanel.add(lblNewLabel_3);
		}
		{
			JLabel label = new JLabel("New label");
			label.setIcon(new ImageIcon(TelaSobre.class.getResource("/icones/gpl.png")));
			label.setBounds(329, 74, 64, 64);
			contentPanel.add(label);
		}
		{
			JLabel lblNewLabel_4 = new JLabel("Site: www.gpl.com.br");
			lblNewLabel_4.setBounds(31, 137, 127, 14);
			contentPanel.add(lblNewLabel_4);
		}
	}

}
