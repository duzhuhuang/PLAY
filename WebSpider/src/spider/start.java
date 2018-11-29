package spider;

import javax.swing.text.html.HTML;

import dao.daoImpl;

public class start {
	public static void main(String[] args) {
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					while(true) {
						String url=new daoImpl().getNextURL();
						String html=HttpClient.httpvisit(url);
						new HTMLanaly().keepNewURL(html);
						HTMLanaly.HtmlIndex(html,url);
						if(url.equals(""))
							throw  new Exception("null url");
					}
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}).start();
	
}
}
