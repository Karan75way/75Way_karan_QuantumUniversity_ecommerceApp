import 'package:flutter/material.dart';
import 'Screens/Authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network(
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABMlBMVEX///8iJCMAAAAkJiX8/////v////0gIiG/wMD8/PyanJv5//+Sk5P9//3+awD///wTFRT/aQD+ggD+bwD9fAD+eAD+YwD+y6b+hQCNjY3/dQD/tYX9cQD29vYZGxrn5+fW1tb+XwD/59ioqKju8O9HSUguLy8KDQy0tLT+8Of+7d7+9OX6+O383sVnZ2f7iAD/jjT/xKT+z8KBgYH9sG1xcnJXWFdMTk3+8dnR09P/uY/8TwD/KQD9kQf9OwA2ODf8wo7/sHv+uX//l1n/o1f+hyT/1bv9za/6omP/sYv6mT770q/6pFn+wZv848n6yLT9fz3+iEn+rYD+eCb+ay/8hjr6lCX7nVv/pXH/oEz+yJn96cn/jFD9oHH+qor939T5kV7+t5783bL95bv9y5H6kWkdrQ/uAAAK80lEQVR4nO2aC1eb2BqGt7ABEYFwSzAh0XhpNBBj6mU0Hqfa2GhrtbWp06ptpzpz/v9fOO+GeG0du7rOLBvX96ghBIT98t32JYwRBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQxC+Jnm2Uh23Fv4d+8ebRKmQTs1NTs+WHbsW/x/iTigTklYmHbsm/xIiQJ+XEy8hDt+X/hJ7+9N9OL0rS6LR4Pz2mSYvjF+fo+h3/PRjoQkG5XJ6eHnsmVOliV2cTY9KTxbXydLks9tggB+bwyPLMTC7zTm15ZWbmtxnxt7JYqdTwWe3JzMzy6PBDt/Ln0ccgoqJp2pAMtJxWqVTwJ+eGakMyPtQEULo4/dAt/VlmJU2Wh4A8pImXFEjFT7bFLs6QBzbxlCu5vqp/QoYtJXH6APYChmva/QJTkZIIxUFUKP2ACVNHTd10IBX+sA0HVuEPmjBTOICV/8cUItsObDL9VuFFXGraY1WY6bkm9REqHMp6OI/UhqjsfSqP0IaQUZG0MTG+N4fH5LQ7J99SiIEINxnj4r3KmWqqYvdX5ppCTZNz0pgYE6Y1YXwEQw35tkJTN8qT8Vw8NzdXr682bKaq9oMKuJcLhUKDnNNuDJLWnuT6wXjNhqraXs87luU4ePlPosKMD9PyH+WaDeWKvMbGs3E9xsDT42ziSe62DbnKToobbjEqguB3ofBB238/171UWmPDzyqzwkk5n32Wm2UT0m0bKiY7sdyFzVJp6/nW846t6oPipaJbtgzHrNVWsvmKeUkMJkalbKR4qVBlvOD522mmMfrXsHnSbb/wt7oJN7mCVITdELsxt019bqu9ww92drd3EsVMui9ftf80TcXk5t5mu2E32selBq5Zf/N6uxUbnCs2x78v+S/2G6apc5ub56X9Lj9ov8YxxVSSxv6Cu/sGl1YU1eSTrVf+q51TrnDzLl+6ikO5MgHvRDZN/bRcSweE49mwWP5GoQ0paj8EjXrHKvp+4L2dVDkaH39yfJDvNQyb19etL3te5AbWWzs+tALf8/ZN3Vb4u3z15GM+8APnA9/rWX4Q9Q64ikx28NaJrCCy3iWmSNftar6971ivmAJNyS7u5OJOe8zkzGhHUeAEnrNnwpnus+FQbV7sr+Tgq2AatQLRyBYl+TsKX8ONhRkzhXOHUWj5PSsovkdcsvgoajpHh5YfOntcXa02/wgsz/I3itvbVcuLmk2rwfCESn5zw4oiq7lRPTnKe1bQDN4mqs4nPbe4cPbScp2XXPjHiYcLBOsvOB6X+cFpesUeHkA1RijtV0Pn41knauYbeLL3KISCUbE/K9UWxXaqP186K8ny0G2F4Yvt41fHx8cLjfQaBSeMCrYe7zqJoSp8y2v2GolZ7xTdo0SJq80waJcbR0HTtToH+mbQLG4ZiN1Ssekfdct7Pb8ZeFtzcx+KG1aX60YnKH5MGDvoub16mtisph/tHpwaCuPd6ka+UE7mNt83DMWYjEKvC9lvLL/DlPtsiDBcE4VwQso9S8Owlo7pWTmr+9cUsoKHNgs3dKvd9BqBa+0bIhpXRb3kFoxkmKqx2sMbDoVO1xB7oX+UwLO2An+b2SoUhtYq50ar2AxKBmf2YWi9YTzuhZ8S4SBdz2twPIkTa8PaMRgCVOEdPyoxbNkqjvCu5beRCwz+2X3P7sx3V7kU8YfHMP4sJ5d1Nj2TkyfSEyTtpg1N2LDp9xB2gV/tclNRmeNGNjNtjI519ACSaujbyLkK++JHLQYvPUoYEu6C6/3JMYRO8u4HhDArBcEZHpht9sIILmezpSB6yvl5FHZOlkrPS0thsSDOQ+r+mqSZjdmfmsVTruKWCnIA3w38pc3nz59vHofe6Z1V65qXCkUi8ITx1mq5lewE6Wa1SBW6x3Fcj+ur9QThz6DQt1XEOvKZrvPYcf+wua2b/ItfbLG46nbwGIRCaxLpic1dKWyh+igcxo2FcywF3lPEQNR0qwKnWN0SzYbCl30LJYchPBfXUHUTN37tN630VMurnt5pxGsKs/7MqCRNiY9F7RA2ldJZ05sK/WNRMfGrcFEN86EXcx3JHC+2alebUaKbum58Dq0CvNTfNYWJMoWclfPutugIlQLohzkyhWqmkLM9L+zstTLSMD/x/Jf9lMa+hlED/qoyA4mFv/OLWzvZmWd1fq/CISnNMAjE2jwsmYWhzka+Z0NRD0WocANdGoUv4E4mU4y4AKdVeBBGCA/TaETN3qqw4S5yfl8hrlC+tCEUCnouFOJIakMFcRg1EJaGXUc+Sm0IhX0XhF92UCW4uZ8YJu86ImRFtUoMfmfX6kphbr7vlpqkM6kiZXPcqBbat1766vS8cX5+3ijEqqnwnXwzWlqNzz+tf0ESZPsOdhN23nODQ4OlNlT6Chnq8g2FvK+Qp3EIG5q8E7m9c85PO/k6v6XQnqxuRB9P478+VhGaavw29D/FHNW0k9w9wrlSKNxUrDFBkyRpwpC6SK2Xs+D9nneWaSwn7zh57/e/kWEYf5kPfez7Hu5nM+OLEwZ5xwuLRzHKf97dtUXXYCGEQtTpspN6KS+5QQGNRhw2hQ1NtuQHT3E8Piy6luXl/ep/DRODsxPPLV14qdHCnRwci97X0Rvo5v0QldRy13ey+vyPCuWh3EzmpukKaW0tXVRbrl09gKnUhgrfXw8iLypGQRSs/8110zbt/Z5X9Dw8SiRvhdvtnhc5lteJUaRXf89/tZEx+QtrfRLOy+fW8x3kQ/6uWm0h+fKkGuVR+HT+urr+BoFpxJ3Ic3C1TUQzdjfX8595Notpcn7SizzPsz7Uuej7dY/Ql7CiXgOJ/K6Jzst6iO4nNIiyOTGyuDiyli4rTl0beWSZSFfMxlnrgrNTWEFk0RjJoVA3ROYw0bOM985ahVUURdtOzlpvkFqZWUA6QAyZydnZjvC6xtlZQ3gATmjBhoqxJz4QlZKvFlqtvYQZuqgJuF3XzmyIW3Fcp1U45VxVUZAM+69Wa7+BUonu3n021DKJ2fA3PVvBwWtTGf1ci5Le73ELt0DvC13gcppZcUwRW1VV+x6DEgKvxmdCOIo7fFy1kURME9IMbnBd5FK8UfGQdFwEdRSFxcwSNQSgG6EbImdnBjJwwTTHKQq8G96SyeIKUje/z4ZpMskksosV36mKdm2uJlOoKoa4HXrBJtJXqo+LyQwFrYah4H0q3Eech6batiLaDGez8chRSMSkB8YbOMUUlxDhBSvqKKN4BDhFVW38IWpxhm6jvCriIeFKWfNV4QvpzIku6g5uLo4q6HSjEff2S/tDxJmLUb4+/NvNyShpQBdJbyiEo+akleWp8fLw4m9XszSPSKEslkKz9W5JTNGknZlHpVDLJp7S5e4h+eay2+NQmA52+xux6C0/OoX/BCn8ZSGFpPDXJ/0uhvjV0gQqXy7FXL7LFkwxepp96Lb+HMM19D37y2jy9xSm4sV6qTR+/9V+SWZycqpxSNa++82azLIYekgP3dKfZbhWEQrEa9+It8jV5HTpdDDDUMFIaSLthi7OS3ewPJZuhsXoZAC/TpMyPDamrS2vjI6NfsvIytTIs5GxwTTgdcbn5+/4ErC+PHO58D2oXAzpv/9l7stJjYFGv7G5fVC/Q/ugcacO/THYkCAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAY+x/C6SDzksy7lwAAAABJRU5ErkJggg==')),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      // DatabaseProvider().getToken().then((value) {
      //   if (value == '') {
      //     PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
      //   } else {
      //     PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
      //   }
      // });
    });
  }
}
