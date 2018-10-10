import ReactOnRails from 'react-on-rails';

import Map from '../bundles/Map/components/Map';
import ListingsModal from '../bundles/Listings/components/ListingsModal';

// This is how react_on_rails can see stuff in the browser.
ReactOnRails.register({
  Map,
  ListingsModal,
});
