package com.mycompany.colegio_amigos_de_don_bosco;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextPane;
import javax.swing.table.DefaultTableModel;

public class CPatentes {
    public void InsertarPatentes(JTextPane codigo, JTextPane stock, JTextPane titulo, JTextPane inventor, JTextPane titular, JTextPane fecha, JTextPane pais, JTextPane patente){
        
        conexiondb objetoConexion = new conexiondb();
        EntidadPatentes objetoEntidadPatentes = new EntidadPatentes();
        
        String consulta = "insert into patentes (cdidentificacion, stock, titulo, inventor, titular, fecha_registro, pais, patente) values (?,?,?,?,?,?,?);";
        
        Random r = new Random();
        int max=99999,min=10000;
        
        int number = r.nextInt(max - min + 1) + min;
        
        String codPAT = "PAT" + number;
        
        try{
            objetoEntidadPatentes.setCodigo(codPAT);
            objetoEntidadPatentes.setStock(Integer.parseInt(stock.getText()));
            objetoEntidadPatentes.setTitulo(titulo.getText());
            objetoEntidadPatentes.setInventor(inventor.getText());
            objetoEntidadPatentes.setTitular(titular.getText());
            objetoEntidadPatentes.setFecha_registro(fecha.getText());
            objetoEntidadPatentes.setPais(pais.getText());
            objetoEntidadPatentes.setPatente(patente.getText());
            
            CallableStatement cs = objetoConexion.establecerConexion().prepareCall(consulta);
            cs.setString(1, objetoEntidadPatentes.getCodigo());
            cs.setInt(2, objetoEntidadPatentes.getStock());
            cs.setString(3, objetoEntidadPatentes.getTitulo());
            cs.setString(4, objetoEntidadPatentes.getInventor());
            cs.setString(5, objetoEntidadPatentes.getTitular());
            cs.setString(6, objetoEntidadPatentes.getFecha_registro());
            cs.setString(7, objetoEntidadPatentes.getPais());
            cs.setString(8, objetoEntidadPatentes.getPatente());
            
            cs.execute();
            
            JOptionPane.showMessageDialog(null, "Se guardó correctamente");
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "No se guardaron los cambios, error: "+ e.toString());
        }
        finally{
            objetoConexion.cerrarConexion();
        }
    }
    
    public void VerPatentes(JTable TablaCd){
        
        conexiondb objetoConexion = new conexiondb();
        EntidadPatentes objetoEntidadPatentes = new EntidadPatentes();
        
        DefaultTableModel modelo = new DefaultTableModel();
        
        modelo.addColumn("id");
        modelo.addColumn("cdidentificacion");
        modelo.addColumn("stock");
        modelo.addColumn("titulo");
        modelo.addColumn("inventor");
        modelo.addColumn("titular");
        modelo.addColumn("fecha_registro");
        modelo.addColumn("pais");
        modelo.addColumn("patente");
        
        TablaCd.setModel(modelo);
        
        String consulta = "select patentes.id, patentes.cdidentificacion, patentes.stock, patentes.titulo, patentes.inventor, patentes.titular, patentes.fecha_registro, patentes.pais, patentes.patente from patentes;";
        
        try{
            Statement st = objetoConexion.establecerConexion().createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            while(rs.next()){
                objetoEntidadPatentes.setId(rs.getInt("id"));
                objetoEntidadPatentes.setCodigo(rs.getString("cdidentificacion"));
                objetoEntidadPatentes.setStock(rs.getInt("stock"));
                objetoEntidadPatentes.setTitulo(rs.getString("titulo"));
                objetoEntidadPatentes.setInventor(rs.getString("inventor"));
                objetoEntidadPatentes.setTitular(rs.getString("titular"));
                objetoEntidadPatentes.setFecha_registro(rs.getString("fecha_registro"));
                objetoEntidadPatentes.setPais(rs.getString("pais"));
                objetoEntidadPatentes.setPatente(rs.getString("patente"));
                
                modelo.addRow(new Object[]{objetoEntidadPatentes.getId(), objetoEntidadPatentes.getCodigo(), objetoEntidadPatentes.getStock(), objetoEntidadPatentes.getTitulo(), objetoEntidadPatentes.getInventor(), objetoEntidadPatentes.getTitular(), objetoEntidadPatentes.getFecha_registro(), objetoEntidadPatentes.getPais(), objetoEntidadPatentes.getPatente()});
            }
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al mostrar los datos, error: "+ e.toString());
        }
        finally{
            objetoConexion.cerrarConexion();
        }
    }
    
    public void Seleccionar(JTable TablaPatente, JTextPane id, JTextPane codigo, JTextPane stock, JTextPane titulo, JTextPane inventor, JTextPane titular, JTextPane fecha, JTextPane pais, JTextPane patente){
        int fila = TablaPatente.getSelectedRow();
        
        try{
            if(fila>=0){
                id.setText(TablaPatente.getValueAt(fila, 0).toString());
                codigo.setText(TablaPatente.getValueAt(fila, 1).toString());
                stock.setText(TablaPatente.getValueAt(fila, 2).toString());
                titulo.setText(TablaPatente.getValueAt(fila, 3).toString());
                inventor.setText(TablaPatente.getValueAt(fila, 4).toString());
                titular.setText(TablaPatente.getValueAt(fila, 5).toString());
                fecha.setText(TablaPatente.getValueAt(fila, 6).toString());
                pais.setText(TablaPatente.getValueAt(fila, 7).toString());
                patente.setText(TablaPatente.getValueAt(fila, 8).toString());
            }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al selecciona, error: "+ e.toString());
        }
    }
    
    public void ActualizarPatente(JTextPane id, JTextPane stock, JTextPane titulo, JTextPane inventor, JTextPane titular, JTextPane fecha_registro, JTextPane pais, JTextPane patente){
        
        conexiondb objetoConexion = new conexiondb();
        EntidadPatentes objetoEntidadPatentes = new EntidadPatentes();
        
        String consulta = "UPDATE patentes SET patentes.stock = ?, patentes.titulo = ?, patentes.inventor = ?, patentes.titular = ?, patentes.fecha_registro = ?, patentes.pais = ?, patentes.patente = ? WHERE patentes.id = ?;";
        
        try{
            objetoEntidadPatentes.setId(Integer.parseInt(id.getText()));
            objetoEntidadPatentes.setStock(Integer.parseInt(stock.getText()));
            objetoEntidadPatentes.setTitulo(titulo.getText());
            objetoEntidadPatentes.setInventor(inventor.getText());
            objetoEntidadPatentes.setTitular(titular.getText());
            objetoEntidadPatentes.setFecha_registro(fecha_registro.getText());
            objetoEntidadPatentes.setPais(pais.getText());
            objetoEntidadPatentes.setPatente(patente.getText());
            
            CallableStatement cs = objetoConexion.establecerConexion().prepareCall(consulta);
            cs.setInt(1, objetoEntidadPatentes.getStock());
            cs.setString(2, objetoEntidadPatentes.getTitulo());
            cs.setString(3, objetoEntidadPatentes.getInventor());
            cs.setString(4, objetoEntidadPatentes.getTitular());
            cs.setString(5, objetoEntidadPatentes.getFecha_registro());
            cs.setString(6, objetoEntidadPatentes.getPais());
            cs.setString(7, objetoEntidadPatentes.getPatente());
            cs.setInt(8, objetoEntidadPatentes.getId());
            
            cs.execute();
            
            JOptionPane.showMessageDialog(null, "Se modifico correctamente");
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "No se modifico los cambios, error: "+ e.toString());
        }
        finally{
            objetoConexion.cerrarConexion();
        }
    }
    
    public void LimpiarCamposPatente(JTextPane id, JTextPane codigo, JTextPane stock, JTextPane titulo, JTextPane inventor, JTextPane titular, JTextPane fecha_registro, JTextPane pais, JTextPane patente){
        id.setText("");
        codigo.setText("");
        stock.setText("");
        titulo.setText("");
        inventor.setText("");
        titular.setText("");
        fecha_registro.setText("");
        pais.setText("");
        patente.setText("");
    }
    
    public void EliminarPatente(JTextPane id){
        
        conexiondb objetoConexion = new conexiondb();
        EntidadPatentes objetoEntidadPatentes = new EntidadPatentes();
        
        String consulta = "DELETE FROM patentes WHERE patentes.id = ?;";
        
        try{
            objetoEntidadPatentes.setId(Integer.parseInt(id.getText()));
                        
            CallableStatement cs = objetoConexion.establecerConexion().prepareCall(consulta);
            cs.setInt(1, objetoEntidadPatentes.getId());       
            cs.execute();
            
            JOptionPane.showMessageDialog(null, "Se elimino correctamente");
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "No se elimino, error: "+ e.toString());
        }
        finally{
            objetoConexion.cerrarConexion();
        }
    }
}
