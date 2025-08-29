class LWFs_money {
	class Init {
		file = "LWFs\Addons\money\functions";
		class initModule {postInit = 1;};
	};
	
	class Client {
		file = "LWFs\Addons\money\functions\client";
		class initClient {};
	};
	
	class Server {
		file = "LWFs\Addons\money\functions\server";
		class addFunds {};
		class getFunds {};
		class initServer {};
	};
};
